# README

Cache Currency

Pull down repository, bundle and run locally with `rails s`. Requires postgres to be running locally.

I've been using postman but curl would do just as well. 
`/fixer/` endpoint expects the following json
period: "YYYY-MM-DD - YYYY-MM-DD"
base: "EUR" or other three letter country code
other_currency: "XXX" any other three letter country code recognised by Fixer

Will respond with an array of json results each with the following structure

  {
    date: YYYY-MM-DD,
    base: "EUR", or whatever code specified
    other_currency: "XXX",
    rate: number, Fixer's calculated rate
  }

A valid fixer api key will need to be added with `rails credentials:edit` under the following structure

fixer:
  api_key = "xxxxxxxx"


