require 'sinatra'
require_relative 'tasks'


post '/homepage' do
  Tasks.homepage
end


post '/butler' do
  request.body.rewind
  verify_signature(request.body.read)
  Tasks.butler
end


post '/study' do
  request.body.rewind
  verify_signature(request.body.read)
  Tasks.study
end



def verify_signature(payload_body)
  signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), ENV['SECRET_TOKEN'], payload_body)
  return halt 500, "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
end