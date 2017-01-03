cask 'fuze' do
  version :latest
  sha256 :no_check

  url 'https://citadel.thinkingphones.com/api/v1/applications/fuzeapp/mac/versions/latest/download/installer'
  name 'Fuze'
  homepage 'https://www.fuze.com/'

  app 'Fuze.app'
end
