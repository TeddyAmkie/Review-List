# Typescript / GraphQL Review List

A bot-proof review API. Regaining trust in reviews.

### Background:

With review systems easily manipulated through false accounts, spammers, purchased reviews etc. it has become incredibly complicated for companies to curate reviews. This API is a concept for users to curate their own review list and use it universally on the web. Users can add their friends or trusted users, import curated lists, or compare lists against eachother. Putting data in the hands of each individual to curate their own lists and give them the ability to choose who they trust.

### Set-Up:

Note: The current version I was testing with PostGraphile to check the quality of auto-generated GraphQL backend code. Schemas/resolvers are currently not in use. 

``` npm install ```

Current code requires a PostgreSQL database:
``` psql review_list```

```  npx postgraphile -c review_list --watch ```

Congrats, your review list GraphQL API is up and running. 
http://localhost:5000/graphql -- Check out your API / sandbox here. 



#### Code-Snippets



createReview mutation example:

``` mutation {
  createReview(input: {review: {reviewList: 2, reviewer: 3,score:1 reviewee: "Testy McTesterson"}}) {
    review {
      nodeId
      id
      reviewList
      score
      reviewer
      reviewee
    }
  }
}
```
