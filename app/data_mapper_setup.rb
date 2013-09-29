    env = ENV["RACK_ENV"] || "development"

    DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")
	# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
    DataMapper.finalize # After declaring your models, you should finalise them
    DataMapper.auto_upgrade! # However, how database tables don't exist yet. Let's tell datamapper to create them
