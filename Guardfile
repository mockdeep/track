guard 'rspec', cmd: 'rspec --drb' do
  watch(/^spec\/.+_spec\.rb$/)
  watch(/^lib\/(.+)\.rb$/) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { 'spec' }

  # Rails example
  watch(/^app\/(.+)\.rb$/) { |m| "spec/#{m[1]}_spec.rb" }
  watch(/^app\/(.*)(\.erb|\.haml)$/) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$}) do |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb",
    ]
  end
  watch(%r{^spec/support/(.+)\.rb$}) { 'spec' }
  watch(%r{^spec/factories/(.+)\.rb$}) { 'spec' }
  watch('config/routes.rb') { 'spec/controllers' }
  watch('app/controllers/application_controller.rb') { 'spec/controllers' }
end
