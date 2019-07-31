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
 cascading deferrals                            soon after above; easy
 mark item as recurring                         soon after above; easy
 
                                                Aug 1
 
 archive data (eventsAtIndexPath; eventsAtDate)
 CSV email archived data
                                                Aug 3
 
                                                                                                    //views
 calendarVC; populate with eventsAtDate
 list VC (today items)
 list VC (deadlineless items)
 morn/aft/eve/nite VC
                                                Aug 5
 
                                                                                                    //UI
 optimize navigation (should be handled in fixing above bug⁌o⁍)
 settingsmenu
 darkMode
 buttons
 launchScreen
 icon
 
                                                asap

 
 
 
*/
