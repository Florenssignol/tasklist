AlgoliaSearch.configuration = {
    application_id: Rails.application.credentials.algolia_application_id,
    api_key: Rails.application.credentials.algolia_api_key,
    connect_timeout: 2,
    receive_timeout: 30,
    send_timeout: 30,
    batch_timeout: 120,
    search_timeout: 5
  }