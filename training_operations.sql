show databases;
create database training_operations;
use training_operations;
select * from rcm_training_operations_analysis;
select Training_Record_ID,Associate_ID,Experience_Level,RCM_Function,Training_Type,Assessment_Score,Quality_Score from 
rcm_training_operations_analysis;
select Training_Record_ID, Associate_ID, RCM_Function, Training_Type, Assessment_Score, Quality_Score from rcm_training_operations_analysis where Experience_Level = 'Fresher';
select Training_Record_ID, Associate_ID, RCM_Function, Training_Type, Assessment_Score, Quality_Score from rcm_training_operations_analysis where Experience_Level = 'Fresher' and Training_Type = 'OJT' and 
Assessment_Score > 80;
select Training_Record_ID, Associate_ID, RCM_Function, Training_Type, Assessment_Score, Quality_Score from rcm_training_operations_analysis where Experience_Level = 'Fresher' and Training_Type = 'OJT' and 
Assessment_Score > 80 order by Assessment_Score desc;
Select Rcm_function, COunt(Training_record_id), Avg(Assessment_Score) as Average_Assessment_Score from rcm_training_operations_analysis where Experience_Level = 'Experienced'
group by RCM_function order by Average_Assessment_Score desc;
select Training_type, avg(Quality_Score) as Average_Quality_Score, avg(Assessment_Score) as Average_Assessment_Score from rcm_training_operations_analysis where 
Experience_Level = 'Fresher' group by Training_type order by Average_Quality_Score desc;
select RCM_FUNCTION, COunt(Training_record_id) as Training_records, avg(Assessment_Score) as Average_Assessment_Score  from rcm_training_operations_analysis where 
Experience_Level = 'Fresher'  group by RCM_FUNCTION having Average_Assessment_Score > '80' order by Average_Assessment_Score desc;
select Training_type, count(Training_Record_ID) as Total_training_record, avg(Planned_Days) as Average_planned_days,
avg(Actual_Days) as average_actual_days from rcm_training_operations_analysis group by Training_type order by average_actual_days desc;
select rcm_function, count(Training_Record_ID) as total_training_records, avg(assessment_score)average_assessmemnt_score,
avg(Quality_score)  as Average_quality_score, avg(actual_days) as Average_actual_days from rcm_training_operations_analysis  where Training_type = 'OJT'
group by rcm_function order by average_quality_score desc;
select training_type, 
COUNT(Training_Record_ID) AS Total_training_record, 
AVG(assessment_score) AS average_assessmemnt_score, 
AVG (Quality_score) AS Average_quality_score,
count(CASE WHEN actual_days > planned_days THEN 1 END) as Total_extended_training, 
count(CASE WHEN actual_days > planned_days THEN 1 END) / count(Training_Record_ID)* 100 as percentage
from rcm_training_operations_analysis group by training_type order by percentage
desc;
use Training_operations;
select RCM_function, count(Training_Record_ID) as Total_training_record, avg(actual_days) as Average_actual_days, 
count(CASE WHEN actual_days > planned_days THEN 1 END) as Total_extended_training,
count(CASE WHEN actual_days > planned_days THEN 1 END) / count(Training_Record_ID)*100 as percentage from rcm_training_operations_analysis where experience_level = 'fresher'
group by rcm_function order by percentage desc;
select Training_type, Count(Training_Record_ID) as Total_training_record, avg(quality_score) as avgerage_quality_score,
Count(case when assessment_score > 80 then 1 end) as Number_of_records,
Count(case when assessment_score > 80 then 1 end)/Count(Training_Record_ID)*100 as Percentage_No_reords from rcm_training_operations_analysis where experience_level = 'fresher'
group by Training_type
order by Percentage_No_reords desc;
select RCM_FUNCTION, count(Training_Record_ID) as Total_training_record, avg(assessment_score) as aveegare_assessment_score,
Count(case when Quality_score>85 then 1 end) as Number_of_records,
Count(case when Quality_score>85 then 1 end) / count(Training_Record_ID)*100 as Percentage_of_records from rcm_training_operations_analysis
where experience_level = 'Experienced' 
group by RCM_function order by Percentage_of_records desc;
select Training_type, Count(Training_Record_ID) as Total_training_record, avg(Retraining_Hours) as avg_retraining_hours,
count(case when actual_days > Planned_days then 1 end) as Number_of_records,
count(case when actual_days > Planned_days then 1 end) / Count(Training_Record_ID)*100 as Percentage_extended_training from rcm_training_operations_analysis 
group by Training_type order by Percentage_extended_training desc;
select RCM_Function, count(Training_Record_ID) as Total_training_records, avg(assessment_score) as avg_assessment_score, avg(QUality_score) as avg_quality_score,
Count(case when assessment_score<70 then 1 end) as number_records,
count(case when assessment_score<70 then 1 end) / count(Training_Record_ID) * 100 as Percentage_of_records from rcm_training_operations_analysis where experience_level = 
'fresher' group by RCM_Function order by Percentage_of_records desc;
select Training_type, Count(Training_Record_ID) as Total_training_records, avg(assessment_score) as avg_assessment_score, avg(actual_days),
Count(case when Quality_score<80 then 1 end) as Number_of_records,
Count(case when Quality_score<80 then 1 end) / count(Training_Record_ID)*100 as Percentage_of_records from rcm_training_operations_analysis
where experience_level = 'Experienced' 
group by Training_type order by Percentage_of_records desc;
select training_type, Count(training_record_id) as Total_training_records, avg(assessment_score) as avg_assessment_score, avg(Quality_score)
as average_quality_score,
count(case when Assessment_Score > 80 AND Quality_Score > 85 then 1 end) as Number_of_records,
count(case when Assessment_Score > 80 AND Quality_Score > 85 then 1 end)/Count(training_record_id) *100 as Percentage_of_records from rcm_training_operations_analysis 
group by Training_type order by Percentage_of_records desc;

select training_type, Count(training_record_id) as Total_training_records, avg(assessment_score) as avg_assessment_score, avg(Quality_score)
as average_quality_score,
count(case when Assessment_Score < 70 OR Quality_Score < 75 then 1 end) as Number_of_records,
count(case when Assessment_Score < 70 OR Quality_Score < 75 then 1 end)/Count(training_record_id)*100 as Percentage_of_records from rcm_training_operations_analysis 
 where experience_level = 'Fresher' group by Training_type order by Percentage_of_records desc;
 select RCM_Function, Count(Training_record_ID) as total_Training_records,  avg(assessment_score) as avg_assessment_score, avg(Quality_score)
as average_quality_score, avg(Productivity_Score) as avg_productive_score,
Count(case when assessment_score > 80 and Quality_score > 80 and Productivity_Score > 80 then 1 end) as Number_of_records,
Count(case when assessment_score > 80 and Quality_score > 80 and Productivity_Score > 80 then 1 end) / Count(Training_record_ID)*100 as
Percentage_No_of_records from rcm_training_operations_analysis group by RCM_Function order by Percentage_No_of_records desc;
select Training_type, Count(Training_record_ID) as total_Training_records, avg(assessment_score) as avg_assessment_score, avg(Retraining_Hours) as avg_Retraining_Hours,
count( case when actual_days > Planned_days then 1 end) as Total_extended_training_records,
count( case when actual_days > Planned_days then 1 end)  / Count(Training_record_ID)* 100 as percentage_extended_training 
from rcm_training_operations_analysis group by Training_type having percentage_extended_training  > 8 order by percentage_extended_training  desc;

 select RCM_Function, Count(Training_record_ID) as total_Training_records,  avg(assessment_score) as avg_assessment_score, avg(Quality_score),
 Count(case when productivity_score < 75 then 1 end) as No_of_records,
  Count(case when productivity_score < 75 then 1 end)  / Count(Training_record_ID) * 100 Percentage_No_of_records from rcm_training_operations_analysis 
  group by RCM_function having Percentage_No_of_records > 10 order by Percentage_No_of_records  desc;

