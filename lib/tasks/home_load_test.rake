namespace :benchmark do
  desc 'TestPlan para jMeter'
  task :jmeter_plan, [:url, :count] do |_t, args|
    require 'ruby-jmeter'
    generate_report *extract_options_from(args)
  end

  task :jmeter_plan_login, [:url, :count, :email, :password] do |_t, args|
    require 'ruby-jmeter'
    generate_report_login *extract_options_from(args)
  end

  def extract_options_from(args)
    defaults = {
      url: 'http://localhost:3000',
      count: 10,
      email: '',
      password: ''
    }

    options = defaults.merge(args)
    [options[:url], options[:count].to_i, options[:email], options[:password]]
  end

  def generate_report(url, count, email, password)
    uri = URI(url)
    domain, port = uri.host, uri.port
    test do
      threads count: count do
        defaults domain: domain, port: port
        cookies policy: 'rfc2109', clear_each_iteration: true

        transaction 'home' do
          visit name: '/', url: '/'
        end

        view_results_in_table
        graph_results
        # view_results_tree
        # aggregate_graph
      end
    end.jmx(file: "#{Rails.root}/tmp/home_test_plan.jmx")
  end

  def generate_report_login(url, count, email, password)
    uri = URI(url)
    domain, port = uri.host, uri.port
    test do
      threads count: count do
        defaults domain: domain, port: port
        cookies policy: 'rfc2109', clear_each_iteration: true

        transaction 'home_login' do
          visit name: '/my/users/sign_in', url: '/my/users/sign_in' do
            # extract name: 'authenticity_token', xpath: "//form[@id='new_user']//input[@name='authenticity_token']/@value", tolerant: true
            extract name: 'authenticity_token', regex: "value='(.+?)' name='authenticity_token'", tolerant: true
          end

          # http_header_manager name: 'X-CSRF-Token', value: '${authenticity_token}'

          submit name: '/my/users/sign_in', url: '/my/users/sign_in',
            fill_in: {
              'authenticity_token' => "${authenticity_token}",
              'user[email]' => email,
              'user[password]' => password,
            }

          visit name: '/dashboard/index', url: '/dashboard/index' do
            extract name: 'kpi-sales-plan', 
                    xpath: "//div[contains(@class, 'dashboard__chart__info__item')]//h6", tolerant: true
          end

          # visit name: 'Today', url: '${kpi-sales-plan}'
        end

        view_results_in_table
        graph_results
        # view_results_tree
        # aggregate_graph
      end
    end.jmx(file: "#{Rails.root}/tmp/home_login_test_plan.jmx")
  end

end
