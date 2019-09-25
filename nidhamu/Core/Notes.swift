/* Notes            ･   nidhamu   ･     created by Garth Snyder   aka   gladiusKatana  ⚔️ // File aesthetically optimized for a 13" Macbook Pro
 
 
 
 TASK____________________________________________________________DEADLINE___________(optional "FUN / DIFFICULTY level)*_____________TYPE**

 
 1st commit                                                     July 8 2019
 
 refactor addToTimeBlocks()?                                                        (fun; first-up next session)                    REFACTORING
 save/load upon hour rollover ?                                                     (fun; second-up)                                DATA
 put back animations when tapping to add events                                     (easy; deferred)                                UI
 obviate repositioning when text field presented (even on first rotation)           (easy; deferred)

 mark item recurring (remove by default)                                            (FUN : reward for crushing above 2 tasks)       DATA
 timetableVC deferral-date selection mode                                           (""same as above for DATA tasks below)
 eventsAtDate
 archive data (eventsAtIndexPath; eventsAtDate)
 
 implement archive CSV emails as User setting                                       (FUN; easy)                                     UX
 create Numbers template; populate the above on it (automatically?)                 (FUN; easy except perhaps some of the automation)
 create Excel template; populate the above on it (automatically?)                   (""same as above)
 
 settings menu(fun; easy)                                                           (fun; easy)                                     DESIGN/UX
 button                                                                             ("")
 icon
 launch screen
 triple check applogic, improve comments
 run on my devices which are same as Beta Users'                Wed Sept 25                                         BETA! (ambitious)
              
 
 
 
 login date interval outlined / animated, not perma-coloured                                                                        UI
 implement loopWeeks = false behaviour as User setting                                                                              DATA
 eventsAtDate on calendarVC
 
 mornAftEveNiteVC                                                                                                                   VCs
 listVC (today items)
 listVC (deadlineless items)
                                                                Thurs Sept 26                                       APPSTORE!
 
 
 
 dark mode                                                                                                          DESIGN (ie w/ user feedback)
 prevent User changing nowDate via Settings app                                                                     ***
 cascading deferrals                                                                                                ***
                                                                later as updates
                                                                                                                    */
                                                                                                                    //see notes (*) - (***) below
 
/// *
/// Programming is always fun, but "fun" really means "really fun" and "FUN" means "REALLY fun"
        

/// **
/// my   "DATA"  &  "UI"   labels are often loose proxies for...
/// the       M       &   V     of MVC.   (Why use this new naming?  Mostly since, in this file Notes.swift, I want a categorization class for the project itself, and the code itself, not just the app)
 

/// ***
///  denotes features that may not necessarily be a good idea to implement (eg, should users be *able* to defer *all* their remaining tasks at once?)  Interesting types of questions.




