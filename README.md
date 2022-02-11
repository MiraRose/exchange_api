# README

## Check for Ruby Version 2.7.5
`ruby --version`

## Check for Rails Version 6+
`rails --version`

If one or other version is incorrect, I recommend using a version manager such as [RVM](https://rvm.io/). On Windows, I find it's easiest to set up a Remote Container using VSCode's [Remote Containers extension](https://code.visualstudio.com/docs/remote/containers).

## To Start Server
`rails server`

## To Run Tests
`bundle exec rspec`

## Test Endpoint
Open [http:/localhost:3000/exchange/CAD?converted_from=USD&amount=1.00](http:/localhost:3000/exchange/CAD?converted_from=USD&amount=1.00)

### Note: Depending on whether there are other servers running (say you've already started the react server) this may be on a different port such as 3001