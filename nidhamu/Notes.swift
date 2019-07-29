/* Notes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
 
                                                July. 08, 2019                                      //1st commit


 todo                                           deadline                                            //(todos organized by deadline & ~kind)
 
                                                                                                    //data model
 ⁌o⁍ classifierVC no longer first responder (although displayed) after a test condition: switching to the Settings app / advancing device date, then
                                                                                         resuming the app, *twice* (bug occurs on >= 2nd time) all while
                                                                                         keeping this app in landscape (bug nonexistent in portrait) *
 
                  * this bug seems to be layout-related. Will attempt to obviate it by extending app's orientation adaptibility
                  (eg no autorotating after transitioning from a differently-oriented other app)
 
 timetableVC deferral-date selection mode       after bug is fixed
 cascading deferrals                            soon after above
 mark item as recurring                         soon after above
 
                                                Aug 1
 
 archive data (eventsAtDate & AtIndexPath)
 CSV emails of archive data
                                                Aug 3
 
                                                                                                    //views
 calendarVC; populate with eventsAtDate
 morn/aft/eve/night VC
 list VC (today items)
 list VC (deadlineless items)
                                                Aug 5
 
                                                                                                    //UI
 optimize navigation (being handled with the above bug)
 settings
 buttons
 launchScreen
 icon
                                                asap
 
 

 settings
 timetable VC, hourly blocks
 cascading deferrals
 darkMode
 
 
 
 

 
 
 
*/
