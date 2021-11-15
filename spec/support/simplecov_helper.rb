# frozen_string_literal: true
require 'simplecov'
require 'active_support/core_ext/numeric/time'


module SimpleCovHelper
  def self.configure_profile
    SimpleCov.configure do
      maximum_coverage_drop 0.02 # = allow 0.02% coverage drop
      add_filter 'cache/'
      add_filter 'spec/'
      add_group 'Libraries',         'lib'
      add_group 'Controllers',       'app/controllers'
      add_group 'Helpers',           'app/helpers'
      add_group 'Jobs',              'app/workers'
      add_group 'Models',            'app/models'
      add_group 'Services',          'app/services'
      add_group 'Mailers',           'app/mailers'
      add_group 'Serializer',        'app/serializers'
      add_group 'Long files' do |src_file|
        src_file.lines.count > 100
      end
    end
  end


  def self.start!
    configure_profile
    SimpleCov.start
  end
end
