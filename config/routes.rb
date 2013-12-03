MoviesApp::Application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  root "movies#index"
  resources "movies"
end
