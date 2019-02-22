class EmployeePresenter < SimpleDelegator
  def initialize(model)
    @model = model
  end

  def show
    methods = %i[department store work_shift role]
    only    = %i[id name surname_1 first_day phone address commune avatar email]
    json    = @model.as_json(methods: methods, only: only)
    methods.each { |method| json[method.to_s] = json[method.to_s].name }
    json[:working_today] = @model.working_today?
    json[:should_work_today] = @model.should_work_today?
    json[:achievements] = @model.achievements_month_until_today
    json
  end
end
