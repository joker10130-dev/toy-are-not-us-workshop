pm.test("Status code is 200", function () {
  pm.response.to.have.status(200);
});
pm.test("Product number is 10", function () {
  var jsonData = pm.response.json();
  pm.expect(jsonData.length).to.eql(10);
});
