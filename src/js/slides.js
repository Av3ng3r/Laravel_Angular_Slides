(function() {
  angular.module('website', ['ngAnimate']).constant('TweenMax', TweenMax).factory('ContentService', function() {
    var content, getContent, getPageNames, pageNames;
    content = {
      'home': {
        label: 'Welcome',
        content: 'Laravel and Angular',
        author: 'Etienne Marais'
      },
      'laravel': {
        label: 'Laravel',
        content: 'What is it?',
        items: {
          'Free, open source PHP web application framework': 'Free, open source PHP web application framework',
          'Powerful and Scalable MVC': 'Powerful and Scalable MVC',
          'an API based framework': 'an API based framework'
        }
      },
      'angular': {
        label: 'Angular',
        content: 'What is it?',
        items: {
          'Structural framework for dynamic web apps': 'Structural framework for dynamic web apps',
          'HTML as your template language': 'HTML as your template language',
          'Data binding and Dependency Injection': 'Data binding and Dependency Injection'
        }
      },
      'solid': {
        label: 'Solid principle',
        content: 'This is page content. that has some more content'
      }
    };
    pageNames = ['home', 'laravel', 'angular', 'solid'];
    getContent = function() {
      return content;
    };
    getPageNames = function() {
      return pageNames;
    };
    return {
      getContent: getContent,
      getPageNames: getPageNames
    };
  }).factory('TransitService', function($rootScope) {
    var getTransit, inTransit, setTransit;
    inTransit = false;
    setTransit = function(transit) {
      inTransit = transit;
      return $rootScope.$broadcast('onTransitChanged');
    };
    getTransit = function() {
      return inTransit;
    };
    return {
      getTransit: getTransit,
      setTransit: setTransit
    };
  }).controller('MainCtrl', function($scope, ContentService, TransitService) {
    $scope.pages = ContentService.getContent();
    $scope.pageNames = ContentService.getPageNames();
    $scope.setNextPage = function(e) {
      var page;
      if (e.keyCode === 39) {
        page = $scope.pageNames.indexOf($scope.getCurrentPage());
        $scope.setCurrentPage($scope.pageNames[page + 1]);
      }
      if (e.keyCode === 37) {
        page = $scope.pageNames.indexOf($scope.getCurrentPage());
        return $scope.setCurrentPage($scope.pageNames[page - 1]);
      }
    };
    $scope.currentPage = 'home';
    $scope.page = $scope.pages['home'];
    $scope.isInTransit = false;
    $scope.getCurrentPage = function() {
      return $scope.currentPage;
    };
    $scope.setCurrentPage = function(page) {
      if (page === void 0) {
        page = 'home';
      }
      if ($scope.currentPage !== page) {
        TransitService.setTransit(true);
        $scope.page = $scope.pages[page];
        return $scope.currentPage = page;
      }
    };
    $scope.$on('onTransitChanged', function() {
      return $scope.isInTransit = TransitService.getTransit();
    });
    $scope.isInTransit = function() {
      return TransitService.getTransit();
    };
    return $scope.isCurrentPage = function(page) {
      return $scope.currentPage === page;
    };
  }).directive('bg', function($window) {
    var linker;
    linker = function(scope, element, attrs) {
      var resizeBG, windowElement;
      resizeBG = function() {
        var bgheight, bgwidth, heightdiff, heightratio, widthdiff, widthratio, winheight, winwidth;
        bgwidth = element.width();
        bgheight = element.height();
        winwidth = $window.innerWidth;
        winheight = $window.innerHeight;
        widthratio = winwidth / bgwidth;
        heightratio = winheight / bgheight;
        widthdiff = heightratio * bgwidth;
        heightdiff = widthratio * bgheight;
        if (heightdiff > winheight) {
          return element.css({
            width: winwidth + 'px',
            height: heightdiff + 'px'
          });
        } else {
          return element.css({
            width: widthdiff + 'px',
            height: winheight + 'px'
          });
        }
      };
      resizeBG();
      windowElement = angular.element($window);
      return windowElement.resize(resizeBG);
    };
    return {
      restrict: 'A',
      link: linker
    };
  }).animation('.bg-animation', function($window, TransitService) {
    return {
      enter: function(element, done) {
        var $scope;
        $scope = element.scope();
        TweenMax.set(element, {
          left: $window.innerWidth
        });
        TweenMax.to(element, 0.5, {
          left: 0,
          onComplete: function() {
            $scope.$apply(function() {
              TransitService.setTransit(false);
            });
            done();
          }
        });
      },
      leave: function(element, done) {
        TweenMax.to(element, 0.5, {
          left: -$window.innerWidth,
          onComplete: done
        });
      }
    };
  }).animation('.panel-animation', function($window) {
    return {
      addClass: function(element, className, done) {
        if (className === 'ng-hide') {
          TweenMax.to(element, 0, {
            alpha: 0,
            onComplete: done
          });
        } else {
          done();
        }
      },
      removeClass: function(element, className, done) {
        if (className === 'ng-hide') {
          element.removeClass('ng-hide');
          TweenMax.set(element, {
            alpha: 0,
            left: -element.width()
          });
          TweenMax.to(element, 0.2, {
            alpha: 0.8
          });
          TweenMax.to(element, 0.5, {
            left: 0,
            onComplete: done
          });
        } else {
          done();
        }
      }
    };
  });

}).call(this);
