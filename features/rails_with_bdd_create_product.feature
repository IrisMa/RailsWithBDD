Feature: Create product
  So that customers can browse product by website
  As a site administrator
  I want to create a product in category of website

  Scenario: Create product in Category
  Given a Category named movies
  When I create a movie Injection in the Category movies
  Then Injection should be in the Category movies