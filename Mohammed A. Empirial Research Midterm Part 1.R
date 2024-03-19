#Mohammed A. Al Muhaymin,Md Muhibul Islam, Luis Melo
#HW 4


#To get my directory
getwd()
#We are listing all calling all the files in the specific directory and naming it midterm_csvfiles
crash_csvfiles <- list.files(path = '/Users/mohammed.almuhaymin/Downloads/Empirical Midterm CSV file',full.names = TRUE)

list_crash_csvfiles <-list() #list the files one by one
for (i in 1:length(crash_csvfiles)){#For loop to read the files one by one and calling them no matter the length
  list_crash_csvfiles[[i]] <- read_csv(crash_csvfiles[i])#Reading all the files that was listed
}
combined_crash_csvs <- do.call(bind_rows,list_crash_csvfiles) #Combining all the files to make 848,757 observations

combined_crash_csvs %>% 
  distinct()
##Distinct gets rid of all duplicates 
#552,474 obs od 35 variables


#A tibble: 552,474 × 35
#CrashID CrashDate    CrashTimeHour CrashDateMonth CrashDateYear DayofWeek DayofWeekNumeric CrashTownName NameOfRoadway
#<dbl> <chr>                <dbl>          <dbl>         <dbl> <chr>                <dbl> <chr>         <chr>        
  #1     676 2015/01/01 …            19              1          2015 Thursday                 5 Guilford      MURRAY LANE  
#2     698 2015/01/02 …            11              1          2015 Friday                   6 Brookfield    FEDERAL RD   
#3     723 2015/01/08 …            18              1          2015 Thursday                 5 Guilford      Durham Road …
#4     724 2015/01/09 …            16              1          2015 Friday                   6 Guilford      Boston Post …
#5     726 2015/01/10 …            17              1          2015 Saturday                 7 Guilford      BOSTON POST …
#6     748 2015/01/13 …            21              1          2015 Tuesday                  3 Suffield      RTE.190 BRDG 
#7     757 2015/01/15 …            13              1          2015 Thursday                 5 Guilford      STATE STREET 
#8     793 2015/01/17 …            11              1          2015 Saturday                 7 Plainville    East Street  
#9     900 2015/01/16 …            21              1          2015 Friday                   6 Suffield      SUFFIELD MEA…
#10     906 2015/01/22 …             7              1          2015 Thursday                 5 Guilford      GOOSE LN     
# ℹ 552,464 more rows
# ℹ 26 more variables: NameOfIntersectingRoadway <chr>, CrashSpecificLocation <dbl>, CrashSpecificLocationDesc <chr>,
#   CrashSeverity <chr>, CrashSeverityDesc <chr>, WeatherCondition1 <dbl>, WeatherConditionDesc <chr>,
#   FirstHarmfulEvent <dbl>, FirstHarmfulEventDesc <chr>, SchoolBusRelated <dbl>, SchoolBusRelatedDesc <chr>,
#   MostSevereInjury <chr>, MostSevereInjuryDesc <chr>, RouteClass <dbl>, RouteClassDesc <chr>,
#   MannerOfCrashCollisionImpact <dbl>, MannerCollisionImpactDesc <chr>, TrafficwayClassType <dbl>,
#   TrafficwayClassTypeDesc <chr>, LawEnforcementAgencyName <chr>, TypeOfIntersection <dbl>, …
# ℹ Use `print(n = ...)` to see more rows


#The reason for duplicate could be that the combined data have the information about the same incidents. For example,
#the crash could be a pedestrian crash and interestion crash. It could involve a motorcycle as well.
#There could be other reasons such as erros and glitches in the system. 