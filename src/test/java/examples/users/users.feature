Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Scenario: test json
    Given def json =
      """
      {
        "hotels": [
          { "roomInformation": [{ "roomPrice": 618.4 }], "totalPrice": 618.4  },
          { "roomInformation": [{ "roomPrice": 679.79}], "totalPrice": 679.79 }
        ]
      }
      """
    Then match each json.hotels contains { totalPrice: '#? _ == _$.roomInformation[0].roomPrice' }
    # when validation logic is an 'equality' check, an embedded expression works better
    Then match each json.hotels contains { totalPrice: '#(_$.roomInformation[0].roomPrice)' }

  
  