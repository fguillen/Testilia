# we only process part of the config file that corresponds to the environment
# we're in. this lets us throw an error if a key is not found, but also have
# different key requirements for different environments.
#
# For example, we can have a variable that is only used in staging and production,
# but isn't needed for test/development. If we processed the entire file, we
# would need these variables even in development. We get around this by processing
# only the chunk of the YAML file that corresponds to the current RAILS_ENV

config_template = ERB.new(YAML.load(File.read("#{Rails.root}/config/app_config.yml"))[Rails.env].to_yaml)
APP_CONFIG = YAML.load(config_template.result(binding)).symbolize_keys
