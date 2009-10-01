#!/usr/bin/env ruby
require 'yaml'

APP_ROOT = "#{File.dirname(__FILE__)}/.."
STORAGE_CONFIG = YAML.load_file(File.join(APP_ROOT, 'config/storage.yml'))

