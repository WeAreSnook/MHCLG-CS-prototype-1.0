# This is a snippet to add to middleman's config.ru file if you want to add basic auth to your middleman app on heroku
# NOTE: you need to stick this above the build script like shown below

use Rack::Auth::Basic, "Restricted Area" do |username, password|
    [username, password] == ['username', 'password']
  end
  
  # This part below is just what builds the static site. you only need to add lines 4 - 6 above any build command like shown below.
  use Rack::TryStatic, :root => "build", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']