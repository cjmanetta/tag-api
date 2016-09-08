# TAG API
JSON API with endpoints to read/write information about tags based on their entities.
## Built With
Rails 5 API 
##### Added Gems:
* Active Model Serializers
* RSpec Rails
* Factory Girl
* Database Cleaner
* Pry

## Approach
I decided to use Rails 5 because it comes with API support out the box. I added in Rspec and friends for testing, test object creation and test db management. After some research I added active model serializers to give me some more flexibilty in structuring the JSON responses. I initialized the app with a Postgres db under the assumption that it is more production appropriate than SQLite.

## Areas for Refactoring
###### Schema
I chose to have two models, tags and entities, where entities have many tags and tags belong to one entity. I think the relationship between tags and entities fits more naturally into the many-to-many camp so I would probably add a taggings join table. 
###### Routing
I more or less stuck with the routing schema suggested in the requirements because I originally thought it would be best to just get it working first. However, if I could do this again I would have changed the routing from the outset to follow a more standard nested resources pattern. I still think this might be appropriate even with a many to many relationship between entities and tags because the specs suggest that most operations for tags are performed in the context of their entity. I would probably go with something like this:
```ruby
resources :entities do
    resources :tags, shallow: true
end
get "/tags/stats", to: "tags#stats"
get "/entities/:entity_id/stats", to: "entities#stats"
 ```
###### Versioning
I used nested namespaces to prefix the routes with /api and /v1 to allow for the flexiblity to version the API in the future. If I had more time I would have added a constraint to the api namespace to set the current version as the default if none is given in the request. That way I could have a general /api prefix instead of the prefix with the version number.

Another thing I might do would be to use an api subdomain. However, in weighing either of these improvements I would want to consider other factors like whether the application would be used as an internal stand alone service or a public api as part of a larger domain (as an aside, if it was public or being hit from another domain I would also want to support cors).

###### Tag::aggregate
I wrote a class method to aggregate the tags for the /stats endpoints. I don't think this method belongs in the model -- I'm not really sure where it should live -- but I would bet that I could probably achieve the same thing with a serializer.

###### Testing
If I had some more time I would clean up the tests a bit. There is a lot of repetition in the setup for each  assertion that could be put into helper methods.

In terms of what to test, the responses from the endpoints seemed kind of like the equivalent of feature tests for an api so I started there. As I got into it I realized that there isn't a lot of custom functionality in the app  and it seemed like overkill to test the models and serializers that already have good coverage through rails or active model serializers. The only thing I maybe should have tested was the aggregate method in the Tag model.