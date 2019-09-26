require 'csv'

current_bmes_id = []

CSV.foreach('data/STU-Eligible_To_Register-Fall-09_26_2019.csv', headers: true) do |header|
  if header["Program 1"] == "BSBE-BMES" && header["Term Code Admit"] != "201915"
    current_bmes_id << header["Univ Id"]
    # current_bmes_students << header["Student"]
  end
end

current_bmes_id

taken_bmes201_bmes202_ids = []

CSV.foreach('data/STU-Student Transcript_biomed_09_26_2019.csv', headers: true) do |header|
  if current_bmes_id.include?(header["Univ Id"])
    if header["Course"].start_with?("BMES 201", "BMES 202")
      taken_bmes201_bmes202_ids << header["Univ Id"]
    end
  end
end

no_bmes201_bmes202 = current_bmes_id - taken_bmes201_bmes202_ids

# p no_bmes201_bmes202

result = []

CSV.foreach('data/STU-Eligible_To_Register-Fall-09_26_2019.csv', headers: true) do |header|
  if no_bmes201_bmes202.include?(header["Univ Id"])
    result << header["Univ Id"]
    result << header["Student"]
  end
end

p final_result_list = Hash[*result]