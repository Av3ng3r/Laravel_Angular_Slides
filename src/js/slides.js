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
          'Powerful and Scalable': 'Powerful and Scalable',
          'An API based framework': 'An API based framework'
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
        label: 'Solid principles',
        content: 'Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion',
        items: {
          '5 Basic principles of OOP & design.': '5 Basic principles of OOP & design.',
          'Code Easier to maintain': 'Code Easier to maintain',
          'Easier to extend over time': 'Easier to extend over time'
        }
      },
      'solid_two': {
        label: 'Single responsibility',
        items: {
          'Every class must have single concern': 'Every class must have single concern',
          'Must be encapsulated in that class': 'Must be encapsulated in that class',
          'Services must be aligned with that concern': 'Services must be aligned with that concern'
        }
      },
      'solid_three': {
        label: 'Uncle Bob',
        items: {
          'A class (module) should have one, and only one, reason to change.': 'A class (module) should have one, and only one, reason to change.',
          'Family of functions that serves one actor': 'Family of functions that serves one actor'
        }
      },
      'responsibilities': {
        label: 'Responsibilities',
        content: 'Have profound long term effects',
        items: {
          'Maintainability': 'Maintainability',
          'Flexibility': 'Flexibility'
        }
      },
      'users': {
        label: 'Expects Value',
        content: 'Value will save or make money',
        items: {
          'They pay us for value': 'They pay us for value'
        }
      },
      'users_value_secondary': {
        label: 'The Values',
        content: 'Secondary',
        items: {
          'Expected behaviour': 'Expected behaviour',
          'Without bugs, crashes, delays': 'Without bugs, crashes, delays',
          'Meets current needs': 'Meets current needs'
        }
      },
      'change_request': {
        label: 'Change needed',
        content: 'Software gets out of sync with current needs',
        items: {
          'Users': 'Users',
          'Product owner': 'Product owner',
          'Feature requests': 'Feature requests'
        }
      },
      'users_value_primary': {
        label: 'The Values',
        content: 'Primary',
        items: {
          'Flexible system': 'Flexible system',
          'More needs are met over time': 'More needs are met over time',
          'Profitable': 'Profitable'
        }
      },
      'together': {
        label: 'Bringing it together',
        content: '1st responsibility to keep primary value high',
        items: {
          'Good for the business': 'Good for the business',
          'Easy to change': 'Easy to change',
          'Meets user\'s needs': 'Meets user\'s needs'
        }
      },
      'demo': {
        label: 'Demo',
        content: 'Laravel and Angular comment system',
        items: {
          'https://github.com/laravel/laravel (4.2)': 'https://github.com/laravel/laravel (4.2)',
          'Angular as front end': 'Angular as front end',
          'MySQL DB': 'MySQL DB',
          'Single responsibility': 'Single responsibility'
        }
      },
      'what_to_show': {
        label: 'Laravel',
        items: {
          'RESTful controllers': 'RESTful controllers',
          'Unit testing': 'Unit testing',
          'Easy routing': 'Easy routing'
        }
      },
      'what_to_show_two': {
        label: 'Angular',
        items: {
          'Templating': 'Templating',
          'Services': 'Services',
          'Front Controllers': 'Front Controllers'
        }
      },
      'composer': {
        label: 'Composer',
        content: 'Setup app composer',
        items: {
          'Manage dependencies': 'Manage dependencies',
          'Easier autoloading of classes': 'Easier autoloading of classes',
          'Download base framework (https://github.com/laravel/laravel)': 'Download base framework (https://github.com/laravel/laravel)'
        }
      },
      'composertwo': {
        content: 'Run install',
        img_src: '2.png'
      },
      'app_one': {
        content: 'App structure',
        img_src: '3.png'
      },
      'app_two': {
        content: 'Create DB',
        items: {
          'Link DB details in /app/config/database.php': 'Link DB details in /app/config/database.php'
        },
        img_src: '4.png'
      },
      'app_three': {
        content: 'You have arrived',
        img_src: '5.png'
      },
      'app_migrate': {
        content: 'Setup migrations',
        img_src: '6.png'
      },
      'app_migrate_two': {
        label: 'Adds a migration file',
        img_src: '8.png'
      },
      'app_migrate_three': {
        label: 'Add Fields',
        img_src: '7.png',
        items: {
          'Comment text -> (string)': 'Comment text -> (string)',
          'Author name  -> (string)': 'Author name  -> (string)'
        }
      },
      'app_migrate_four': {
        content: 'Run migrations',
        img_src: '9.png'
      },
      'app_seed': {
        content: 'Seeding your app',
        img_src: '10.png'
      },
      'app_seed_two': {
        content: 'Run seeds',
        img_src: '11.png'
      },
      'app_controllers': {
        content: 'Setup resource controller',
        img_src: '15.png'
      },
      'routes_view': {
        label: 'Routes',
        content: 'Top-down (RESTFUL) view of our application',
        img_src: '16.png'
      },
      'backend_done': {
        label: 'Backend Done',
        content: 'It\'s that easy'
      },
      'angular_files': {
        label: 'Angular file structure',
        content: '',
        img_src: '17.png'
      },
      'angular_service': {
        content: 'Service will handle all data calls',
        img_src: '18.png'
      },
      'angular_controller': {
        content: 'Controller binds data to html',
        img_src: '19.png'
      },
      'angular_app': {
        content: 'App loads modules',
        img_src: '20.png'
      },
      'done': {
        label: 'Done',
        content: 'Questions?'
      }
    };
    pageNames = [];
    jQuery.each(content, function(name, page) {
      return pageNames.push(name);
    });
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
        if (page - 1 < 0) {
          page = $scope.pageNames.length - 1;
        } else {
          page -= 1;
        }
        return $scope.setCurrentPage($scope.pageNames[page]);
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
            alpha: 0.96
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
