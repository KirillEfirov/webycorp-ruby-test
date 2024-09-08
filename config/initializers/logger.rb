# frozen_string_literal: true

log_level = Settings.log_level || Logger::INFO
log_output = case Settings.log_output
             when 'file'
               log_path = "log/#{Application.environment}.log"
               log_directory = File.dirname(log_path)

               FileUtils.mkdir_p(log_directory)

               log_path
             when 'stdout' then $stdout
             else
               raise ArgumentError, "Invalid log output setting: '#{Settings.log_output}'. Expected 'file' or 'stdout'."
             end

Application.logger = Ougai::Logger.new(log_output, level: log_level)
Application.logger.with_fields = { environment: Application.environment }

Stripe.logger = Application.logger
