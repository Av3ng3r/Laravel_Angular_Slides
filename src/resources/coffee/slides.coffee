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
                    'Powerful and Scalable MVC',
                    'an API based framework',
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
                label: 'Solid principle',
                content: 'This is page content. that has some more content'
            },
        }

        pageNames = ['home', 'laravel', 'angular', 'solid']

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
                $scope.setCurrentPage($scope.pageNames[page - 1])

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
                    TweenMax.to(element, 0.2, { alpha: 0.8 })
                    TweenMax.to(element, 0.5, { left: 0, onComplete: done })
                else
                    done()
                return
        }
    )