#!/usr/bin/env ruby
require 'yaml'

STORAGE_CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'storage.yml'))
