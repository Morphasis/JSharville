myApp = angular.module("myApp", [])
myApp.controller "PostController", ["$scope", ($scope) ->
  # this is for setting the current project on the homepage
  $scope.currentproject = ->
    curproj = $scope.project
    localStorage['curproj'] = curproj
    location.reload()
    return
  $scope.clearproj = ->
    localStorage.removeItem("curproj");
    location.reload()
    alert "Project removed"
    return
  $scope.curproj = localStorage['curproj']
  # clear posts function clears ALL posts
  $scope.clearposts = ->
    console.log "posts cleared"
    localStorage.removeItem("posts");
    location.reload()
    return
  # sets a posts array
  $scope.posts = []
  if !localStorage['posts']
    console.log "there are currently no posts avalible"
  else
    $scope.posts = JSON.parse(localStorage['posts'])
  # this is to add new posts to the post array and save them in localStorage
  $scope.addpost = ->
    $scope.posts.push
      header: $scope.header
      content: $scope.content
    posts = $scope.posts
    localStorage['posts'] = JSON.stringify(posts)
    $scope.header = null
    $scope.content = null
  return
]
# this was a test custom directive im using this to copy paste later if i need one
myApp.directive "welcome", ->
  restrict: "E"
  template: "<div>Howdy there! You look splendid.</div>"
