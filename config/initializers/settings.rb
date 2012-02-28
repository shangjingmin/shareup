# load app settings

Settings = YAML::load(File.read(Rails.root+"config/settings.yml"))[Rails.env]

