angular.module('website', ['ngAnimate'])
    .constant('TweenMax', TweenMax)
    .factory 'ContentService', () ->
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
                    'Free, open source PHP web application framework',
                    'Powerful and Scalable',
                    'An API based framework',
                }
            },
            'angular': {
                label: 'Angular',
                content: 'What is it?',
                items: {
                    'Structural framework for dynamic web apps',
                    'HTML as your template language',
                    'Data binding and Dependency Injection',
                }
            },
            'solid': {
                label: 'Solid principles',
                content: 'Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion',
                items: {
                    '5 Basic principles of OOP & design.',
                    'Code Easier to maintain',
                    'Easier to extend over time',
                }
            },
            'solid_two': {
                label: 'Uncle Bob',
                items: {
                    'A class should have one, and only one, reason to change.',
                }
            },
            'responsibilities': {
                label: 'Responsibilities',
                content: 'Have profound long term effects',
                items: {
                    'Maintainability',
                    'Flexibility',
                }
            },
            'responsibilities_two': {
                label: 'Definition',
                items: {
                    'Family of functions that serves one actor',
                }
            },
            'users': {
                label: 'Expects Value',
                content: 'Value will save or make money',
                items: {
                    'They pay us for value',
                }
            },
            'users_value_secondary': {
                label: 'The Values',
                content: 'Secondary',
                items: {
                    'Expected behaviour',
                    'Without bugs, crashes, delays',
                    'Meets current needs'
                }
            },
            'change_request': {
                label: 'Change needed',
                content: 'Software gets out of sync with current needs',
                items: {
                    'Users',
                    'Product owner',
                    'Feature requests',
                }
            },
            'users_value_primary': {
                label: 'The Values',
                content: 'Primary',
                items: {
                    'Flexible system',
                    'More needs are met',
                    'Profitable',
                }
            },

            'together': {
                label: 'Bringing it together',
                content: '1st responsibility to keep primary value high',
                items: {
                    'Good for the business',
                    'Easy to change',
                    'Meets user\'s needs',
                }
            },
            'demo': {
                label: 'Demo',
                content:'Laravel and Angular comment system',
                items: {
                    'https://github.com/laravel/laravel',
                    'Angular as front end',
                    'MySQL DB',
                    'Single responsibility'
                }
            },
            'composer': {
                label: 'Composer',
                content: 'Setup app composer',
                items: {
                    'Manage dependencies',
                    'Easier autoloads'
                }
            },
            'composertwo': {
                #label: 'Composer',
                content: 'Run install',
                img_src: '2.png'
            },
            'app_one': {
                #label: 'Composer',
                content: 'App structure',
                img_src: '3.png'
            },
            'app_two': {
            #label: 'Composer',
                content: 'Create DB',
                img_src: '4.png'
            },
            'app_three': {
            #label: 'Composer',
                content: 'You have arrived',
                img_src: '5.png'
            },
            'routes': {
                label: 'We\'ll need some routes',
                content: '',
                items: {
                    'Home page [ / ]',
                    'Catchall route [ redirects to / ]',
                    'One API route [ /api/... ]',
                }
            },
            'routes_view': {
                label: 'Routes',
                content: 'Top-down (RESTFUL) view of our application',
                img_src: '16.png'
            },
            'backend_done': {
                label: 'Backend Done'
                content: 'It\'s that easy'
            },
            'angular_files': {
                label: 'Angular file structure',
                content: '',
                img_src: '17.png'
            }
        }

        pageNames = []
        jQuery.each(content, (name, page) ->
            pageNames.push(name)
        )

        getContent = () ->
            return content

        getPageNames = () ->
            return pageNames

        return {
            getContent: getContent,
            getPageNames: getPageNames
        }

    .factory 'TransitService', ($rootScope) ->
        inTransit = false;

        setTransit = (transit) ->
            inTransit = transit;
            $rootScope.$broadcast('onTransitChanged');

        getTransit = () ->
            return inTransit;

        return {
            getTransit: getTransit,
            setTransit: setTransit
        }

    .controller 'MainCtrl', ($scope, ContentService, TransitService) ->
        $scope.pages = ContentService.getContent()

        $scope.pageNames = ContentService.getPageNames()

        $scope.setNextPage = (e) ->
            if e.keyCode == 39
                page = $scope.pageNames.indexOf($scope.getCurrentPage())
                $scope.setCurrentPage($scope.pageNames[page + 1])
            if e.keyCode == 37
                page = $scope.pageNames.indexOf($scope.getCurrentPage())

                if (page - 1 < 0)
                    page = $scope.pageNames.length - 1
                else
                    page -= 1

                $scope.setCurrentPage($scope.pageNames[page])

        $scope.currentPage = 'home';
        $scope.page = $scope.pages['home'];
        $scope.isInTransit = false;

        $scope.getCurrentPage = () ->
            return $scope.currentPage

        $scope.setCurrentPage = (page) ->
            if page == undefined
                page = 'home'
            if ($scope.currentPage != page)
                TransitService.setTransit(true)
                $scope.page = $scope.pages[page]
                $scope.currentPage = page

        $scope.$on('onTransitChanged', () ->
            $scope.isInTransit = TransitService.getTransit();
        )

        $scope.isInTransit = () ->
            return TransitService.getTransit();

        $scope.isCurrentPage = (page) ->
            return $scope.currentPage == page;

    .directive 'bg', ($window) ->
        # Adapted from http://bavotasan.com/2011/full-sizebackground-image-jquery-plugin/ Thanks @bavotasan!
        linker = (scope, element, attrs) ->
            resizeBG = () ->
                bgwidth = element.width()
                bgheight = element.height()

                winwidth = $window.innerWidth
                winheight = $window.innerHeight

                widthratio = winwidth / bgwidth
                heightratio = winheight / bgheight

                widthdiff = heightratio * bgwidth
                heightdiff = widthratio * bgheight

                if (heightdiff > winheight)
                    element.css({
                        width: winwidth + 'px',
                        height: heightdiff + 'px'
                    })
                else
                    element.css({
                        width: widthdiff + 'px',
                        height: winheight + 'px'
                    })

            resizeBG();

            windowElement = angular.element($window)
            windowElement.resize(resizeBG)

        return {
            restrict: 'A',
            link: linker
        }
    .animation('.bg-animation', ($window, TransitService) ->
        return {
            enter: (element, done) ->
                $scope = element.scope()

                TweenMax.set(element, { left: $window.innerWidth})
                TweenMax.to(element, 0.5, {left: 0, onComplete: () ->
                    $scope.$apply(() ->
                        TransitService.setTransit(false)
                        return
                    )
                    done()
                    return
                })
                return

            leave: (element, done) ->
                TweenMax.to(element, 0.5, {left: -$window.innerWidth, onComplete: done})
                return
        }
    )
    .animation('.panel-animation', ($window) ->
        return {
            addClass: (element, className, done) ->
                if className == 'ng-hide'
                    TweenMax.to(element, 0, { alpha: 0, onComplete: done })
                else
                    done();
                return
            removeClass: (element, className, done) ->
                if className == 'ng-hide'
                    element.removeClass('ng-hide')
                    TweenMax.set(element, { alpha: 0, left: -element.width() })
                    TweenMax.to(element, 0.2, { alpha: 0.96 })
                    TweenMax.to(element, 0.5, { left: 0, onComplete: done })
                else
                    done()
                return
        }
    )