RailsExperiment::Application.routes.draw do
  root "welcome#index"
  get "calculator/add/:a/:b" => "calculator#add_numbers"
  get "calculator/add_json/:a/:b" => "calculator#add_numbers_json"
end
