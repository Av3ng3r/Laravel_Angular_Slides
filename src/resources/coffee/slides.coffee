angular.module('website', ['ngAnimate'])
    .constant('TweenMax', TweenMax)
    .factory 'ContentService', () ->

        #
        # START POMODORO
        #

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
                # Also ng-repeat automatically orders alphabetically !!
            },
            'solid': {
                label: 'Solid principles',
                content: 'Single responsibility, Open-closed, Liskov substitution, Interface segregation and Dependency inversion',
                items: {
                    '5 Basic principles of OOP & design.',
                    'Code Easier to maintain',
                    'Easier to extend over time',
                }
                # a class should have only a single responsibility
                # software entities … should be open for extension, but closed for modification.
                # objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program
                # many client-specific interfaces are better than one general-purpose interface
                # one should “Depend upon Abstractions. Do not depend upon concretions (laravel does this very well)
            },
            'solid_two': {
                label: 'Single responsibility',
                items: {
                    'Every class must have single concern',
                    'Must be encapsulated in that class',
                    'Services must be aligned with that concern',
                }
            },
            'solid_three': {
                label: 'Uncle Bob',
                items: {
                    'A class (module) should have one, and only one, reason to change.',
                    'Family of functions that serves one actor',
                }
                # Adhering to the SRP and has long term effects
                # if we need to change the way we delete users, only one class needs to be updated.
            },
            'responsibilities': {
                label: 'Responsibilities',
                content: 'Have profound long term effects',
                items: {
                    'Maintainability',
                    'Flexibility',
                }
            },
            'users': {
                label: 'Expects Value',
                content: 'Value will save or make money',
                items: {
                    'They pay us for value',
                }
                # Software we build them will either save them money or make them money
            },
            'users_value_secondary': {
                label: 'The Values',
                content: 'Secondary',
                items: {
                    'Expected behaviour',
                    'Without bugs, crashes, delays',
                    'Meets current needs'
                }
                # Secondary value is high when SW meets current needs
                # Current needs often makes of inflexible app structure
                # Users needs changes
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
                    'More needs are met over time',
                    'Profitable',
                }
                # ( Focus on this a bit )
                # High primary value means that initially the secondary value will be lower
                # Up to devs to mitigate those client expectations
                # Secondary value will grow over time and match primary value when program is complete
            },

            'together': {
                label: 'Bringing it together',
                content: '1st responsibility to keep primary value high',
                items: {
                    'Good for the business',
                    'Easy to change',
                    'Meets user\'s needs',
                }
                # High changability makes for easy adaptations
                # Easy adaptations makes evolving less of a pain
                # Evolving with clients makes clients happy
            },
            'demo': {
                label: 'Demo',
                content:'Laravel and Angular comment system',
                items: {
                    'https://github.com/laravel/laravel (4.2)',
                    'Angular as front end',
                    'MySQL DB',
                    'Single responsibility'
                }
            },
            'what_to_show': {
                label: 'Laravel',
                items: {
                    'RESTful controllers',
                    'Unit testing',
                    'Easy routing'
                }
            },
            'what_to_show_two': {
                label: 'Angular',
                items: {
                    'Templating',
                    'Services',
                    'Front Controllers'
                }
            },
            'composer': {
                label: 'Composer',
                content: 'Setup app composer',
                items: {
                    'Manage dependencies',
                    'Easier autoloading of classes',
                    'Download base framework (https://github.com/laravel/laravel)'
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
                    'Link DB details in /app/config/database.php',
                }
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
                label: 'Adds a migrate file',
                img_src: '8.png'
                # File date for deployment
                # Uses Blueprint schema to build table
            },
            'app_migrate_three': {
                label: 'Add Fields',
                img_src: '7.png'
                items: {
                    'Comment text -> (string)',
                    'Author name  -> (string)',
                }
            },
            'app_migrate_four': {
                content: 'Run migrations',
                img_src: '9.png'
            },
            # Will run all your migrations based on date
            'app_seed': {
                content: 'Seeding your app',
                img_src: '10.png'
            },
            # To take the hastle out of populating your DB manually
            # A way of testing your models (finger quotes)

            'app_seed_two': {
                content: 'Run seeds',
                img_src: '11.png'
            },
            # If class not found, remember to run your composer dump-autoload
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
                label: 'Backend Done'
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
            # Controller binds data to html

            'angular_app': {
                content: 'App loads modules',
                img_src: '20.png'
            },

            'done': {
                label: 'Done',
                content: 'Questions?'
            },

            # SHOW DEMO HERE

            # SHOW CONTROLLER UNIT TESTS IF TIME LEFT
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