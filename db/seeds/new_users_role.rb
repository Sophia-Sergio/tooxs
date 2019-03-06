user = User.find_by(email: 'storres@tooxs.com')
user.add_role :store_manager
