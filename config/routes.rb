Rails.application.routes.draw do
  root to: 'altair#home'
  get '/signup',    to: 'users#new'
  get '/signin',    to: 'sessions#new'
  get '/signout',   to: 'sessions#destroy'
  get '/im',        to: 'users#show'
  get '/ul',        to: 'users#persons'
  get '/um',        to: 'users#marks'
  get '/statistic:t_name/:u_name', to: 'admin#statistic' ,as: 'statistic'
  get '/statistic:t_name', to: 'admin#full_statistic' ,as: 'f_statistic'
  delete 'ud:id',     to: 'users#destroy',as: 'ud'
  patch '/uu:id',      to: 'users#update',as: 'uu'
  post '/signin',   to: 'sessions#create'
  post '/signup',   to: 'users#create'
  post '/block',    to: 'block#create'
  post '/ue:id',     to: 'users#edit', as: 'ue'
  post '/db',       to: 'uses#update'

  get '/home',      to: 'altair#home'
  get '/about',     to: 'altair#about'
  get '/help',      to: 'altair#help'
  get '/contact',   to: 'altair#contact'
  get '/theory',    to: 'altair#theory'
  get '/admin',     to: 'admin#show'
  get '/block',     to: 'block#show'
  get '/db',        to: 'uses#db_con'
   get    'cy',      to: 'cats#show'
  post   'cy',      to: 'cats#create'
  delete  'cd:id',  to: 'cats#destroy', as: 'cd'
  patch   'cu:id',  to: 'cats#update',  as: 'cu'
  post   'ce:id',   to: 'cats#edit',     as: 'ce'

  post  'te:id',            to: 'tasks#edit', as: 'te'
  get   'tm',            to: 'tasks#new'
  get   'tl',            to: 'tasks#show'
  post   'tm',            to: 'tasks#create'
  patch   'tup:id',            to: 'tasks#update', as: 'tup'
  delete   'td:id',            to: 'tasks#destroy',as: 'td'

  get    'tsn'   ,               to:'tests#new'
  post   'tsn'   ,               to:'tests#create'
  get    'tsl'   ,               to:'tests#show'
  patch   'tsu:id'   ,           to:'tests#update', as: 'tsu'
  post    'tse:id'   ,           to:'tests#edit', as: 'tse'
  delete   'tsd:id'   ,          to:'tests#destroy', as: 'tsd'
  get     'tpn'                      ,to:'tpublics#new'
  post     'tpn'                      ,to:'tpublics#create'
  get     'errors'                      ,to:'uses#ers'
  get 'start:test_name' ,to:'inspection#show' ,as:'start'
  post 'start:test_name' ,to:'inspection#create' ,as:'sta'
  post 'auth:test_name' ,to: 'tests#block' ,as:'auth'
  post 'password_c:test_name' ,to: 'tests#password_c' ,as:'password_c'
  post  'query'   ,to: 'inspection#response_'
  delete 'repeat:test/:user'   ,to: 'inspection#destroy',as: 'repeat'
end

