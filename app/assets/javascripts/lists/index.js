const algoliasearch = require('algoliasearch');

const client = algoliasearch('app id', 'api key');
const index = client.initIndex('lists');

const objects = [{
  objectID: 1,
  name: 'Foo'
}];

index
  .saveObjects(objects)
  .then(({ objectIDs }) => {
    console.log(objectIDs);
  })
  .catch(err => {
    console.log(err);
  });

index
  .search('Fo')
  .then(({ hits }) => {
    console.log(hits);
  })
  .catch(err => {
    console.log(err);
  });