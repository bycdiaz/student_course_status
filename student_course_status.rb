require 'csv'

current_bmes_students = []

CSV.foreach('data/STU-Eligible_To_Register-Fall-09_26_2019.csv', headers: true) do |header|
  if header["Program 1"] == "BSBE-BMES"
    current_bmes_students << header["Univ Id"]
    current_bmes_students << header["Student"]
  end
end

current_bmes_id_name = Hash[*current_bmes_students]