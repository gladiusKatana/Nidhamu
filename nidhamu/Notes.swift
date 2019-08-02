/* Notes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️
 
                                                July. 08, 2019                                      //1st commit


 todo                                           deadline                                            //(todos organized by deadline & ~kind)
 
 
 
⁌o⁍ classifierVC no longer 1st responder (displayed though) after test condition: adding an item, switching to Settings, advancing device date, then
                                                                                    resuming the app, *twice* (bug occurs on >= 2nd time), all while
                                                                                    keeping this app in landscape (bug nonexistent in portrait) *
 
                                                                                    * this bug seems to be layout-related. Will attempt to obviate it, perhaps** by extending app's orientation adaptibility (eg no autorotating after transitioning from a differently-oriented other app)  **that is, if iOS makes this possible (or at least not time-sinkingly-laborious)
 
 timetableVC deferral-date selection mode       after bug is fixed
 cascading deferrals                            soon after above; easy
 mark item as recurring                         soon after above; easy
 
                                                Mon Aug 5
 
 archive data (eventsAtIndexPath; eventsAtDate)
 CSV email archived data
                                                Thurs Aug 8
 
                                                                                                    //views
 calendarVC; populate with eventsAtDate
 list VC (today items)
 list VC (deadlineless items)
 morn/aft/eve/nite VC
                                                Sun Aug 11
 
                                                                                                    //UI
 optimize navigation (should be handled in fixing above bug⁌o⁍)
 settingsmenu
 darkMode
 buttons
 launchScreen
 icon
 
                                                asap

 
 
 
*/
