set :environment, "development"
job_type :rake, "cd :path && :environment_variable=:environment rake :task --silent"

every 7.days  do
  command "echo 'you can use raw cron sytax too'"
end
