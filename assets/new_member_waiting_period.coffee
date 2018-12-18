Session = require 'shared/services/session'
AbilityService = require 'shared/services/ability_service'

angular.module('loomioApp').config ['$provide', ($provide) ->
  $provide.decorator 'pollCommonActionPanelDirective', ['$delegate', ($delegate) ->

    $delegate[0].compile = ->
      ($scope, elem) ->
        # Override the userCanParticipate to also check how long user has been a member
        $scope.userCanParticipate = ->
          AbilityService.canParticipateInPoll($scope.poll) &&
            Session.user().createdAt.isBefore(moment().subtract(30, 'days'))

    $delegate
  ]
]
