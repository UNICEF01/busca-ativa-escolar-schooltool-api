# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "activity_log", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.string "user_id", limit: 36
    t.string "content_type", null: false
    t.string "content_id", limit: 36, null: false
    t.string "action", null: false
    t.json "parameters"
    t.json "metadata"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["action"], name: "activity_log_action_index"
    t.index ["content_id"], name: "activity_log_content_id_index"
    t.index ["content_type"], name: "activity_log_content_type_index"
    t.index ["tenant_id"], name: "activity_log_tenant_id_index"
    t.index ["user_id"], name: "activity_log_user_id_index"
  end

  create_table "attachments", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.string "content_type", null: false
    t.string "content_id", limit: 36, null: false
    t.string "uploader_id", limit: 36
    t.string "mime_type"
    t.string "uri", limit: 512
    t.string "location"
    t.json "metadata"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.text "description", limit: 16777215
    t.string "file_name"
    t.index ["content_id"], name: "attachments_content_id_index"
    t.index ["content_type"], name: "attachments_content_type_index"
    t.index ["tenant_id"], name: "attachments_tenant_id_index"
    t.index ["uploader_id"], name: "attachments_uploader_id_index"
  end

  create_table "case_steps_alerta", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.string "name"
    t.string "gender"
    t.string "race"
    t.date "dob"
    t.string "rg"
    t.string "cpf"
    t.string "nis"
    t.string "cns", limit: 15
    t.integer "alert_cause_id"
    t.string "mother_name"
    t.string "mother_rg"
    t.string "mother_phone"
    t.string "father_name"
    t.string "father_rg"
    t.string "father_phone"
    t.string "place_address"
    t.string "place_cep"
    t.string "place_reference"
    t.string "place_neighborhood"
    t.string "place_city_name"
    t.string "place_uf"
    t.string "place_phone"
    t.string "place_mobile"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "place_city_id", limit: 36
    t.string "alert_status", default: "pending", null: false
    t.datetime "started_at"
    t.decimal "place_lat", precision: 18, scale: 12
    t.decimal "place_lng", precision: 18, scale: 12
    t.string "place_map_region"
    t.json "place_map_geocoded_address"
    t.text "observation", limit: 4294967295
    t.index ["alert_cause_id"], name: "case_steps_alerta_alert_cause_id_index"
    t.index ["alert_status"], name: "case_steps_alerta_alert_status_index"
    t.index ["assigned_group_id"], name: "case_steps_alerta_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_alerta_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_alerta_case_id_index"
    t.index ["child_id"], name: "case_steps_alerta_child_id_index"
    t.index ["completed_at"], name: "case_steps_alerta_completed_at_index"
    t.index ["gender"], name: "case_steps_alerta_gender_index"
    t.index ["is_completed"], name: "case_steps_alerta_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_alerta_is_pending_assignment_index"
    t.index ["next_index"], name: "case_steps_alerta_next_index_index"
    t.index ["next_type"], name: "case_steps_alerta_next_type_index"
    t.index ["place_cep"], name: "case_steps_alerta_place_cep_index"
    t.index ["place_city_id"], name: "case_steps_alerta_place_city_id_index"
    t.index ["place_city_name"], name: "case_steps_alerta_place_city_index"
    t.index ["place_uf"], name: "case_steps_alerta_place_uf_index"
    t.index ["race"], name: "case_steps_alerta_race_index"
    t.index ["step_index"], name: "case_steps_alerta_step_index_index"
    t.index ["step_type"], name: "case_steps_alerta_step_type_index"
    t.index ["tenant_id"], name: "case_steps_alerta_tenant_id_index"
  end

  create_table "case_steps_analise_tecnica", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.text "analysis_details", limit: 16777215
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.datetime "started_at"
    t.index ["assigned_group_id"], name: "case_steps_analise_tecnica_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_analise_tecnica_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_analise_tecnica_case_id_index"
    t.index ["child_id"], name: "case_steps_analise_tecnica_child_id_index"
    t.index ["completed_at"], name: "case_steps_analise_tecnica_completed_at_index"
    t.index ["is_completed"], name: "case_steps_analise_tecnica_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_analise_tecnica_is_pending_assignment_index"
    t.index ["next_index"], name: "case_steps_analise_tecnica_next_index_index"
    t.index ["next_type"], name: "case_steps_analise_tecnica_next_type_index"
    t.index ["step_index"], name: "case_steps_analise_tecnica_step_index_index"
    t.index ["step_type"], name: "case_steps_analise_tecnica_step_type_index"
    t.index ["tenant_id"], name: "case_steps_analise_tecnica_tenant_id_index"
  end

  create_table "case_steps_gestao_do_caso", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.json "identified_cause_ids"
    t.string "risk_level"
    t.text "actions_description", limit: 16777215
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.datetime "started_at"
    t.index ["assigned_group_id"], name: "case_steps_gestao_do_caso_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_gestao_do_caso_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_gestao_do_caso_case_id_index"
    t.index ["child_id"], name: "case_steps_gestao_do_caso_child_id_index"
    t.index ["completed_at"], name: "case_steps_gestao_do_caso_completed_at_index"
    t.index ["is_completed"], name: "case_steps_gestao_do_caso_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_gestao_do_caso_is_pending_assignment_index"
    t.index ["next_index"], name: "case_steps_gestao_do_caso_next_index_index"
    t.index ["next_type"], name: "case_steps_gestao_do_caso_next_type_index"
    t.index ["risk_level"], name: "case_steps_gestao_do_caso_risk_level_index"
    t.index ["step_index"], name: "case_steps_gestao_do_caso_step_index_index"
    t.index ["step_type"], name: "case_steps_gestao_do_caso_step_type_index"
    t.index ["tenant_id"], name: "case_steps_gestao_do_caso_tenant_id_index"
  end

  create_table "case_steps_observacao", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.date "report_date"
    t.integer "report_index"
    t.boolean "is_child_still_in_school"
    t.string "evasion_reason"
    t.text "observations", limit: 16777215
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.datetime "started_at"
    t.date "reinsertion_date"
    t.date "reinsertion_date_original"
    t.string "reinsertion_date_change_reason"
    t.index ["assigned_group_id"], name: "case_steps_observacao_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_observacao_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_observacao_case_id_index"
    t.index ["child_id"], name: "case_steps_observacao_child_id_index"
    t.index ["completed_at"], name: "case_steps_observacao_completed_at_index"
    t.index ["is_child_still_in_school"], name: "case_steps_observacao_is_child_still_in_school_index"
    t.index ["is_completed"], name: "case_steps_observacao_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_observacao_is_pending_assignment_index"
    t.index ["next_index"], name: "case_steps_observacao_next_index_index"
    t.index ["next_type"], name: "case_steps_observacao_next_type_index"
    t.index ["report_index"], name: "case_steps_observacao_report_index_index"
    t.index ["step_index"], name: "case_steps_observacao_step_index_index"
    t.index ["step_type"], name: "case_steps_observacao_step_type_index"
    t.index ["tenant_id"], name: "case_steps_observacao_tenant_id_index"
  end

  create_table "case_steps_pesquisa", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.string "name"
    t.string "gender"
    t.string "race"
    t.date "dob"
    t.string "rg"
    t.string "cpf"
    t.json "nis"
    t.string "cns", limit: 15
    t.boolean "has_been_in_school"
    t.text "reason_not_enrolled", limit: 16777215
    t.string "school_last_grade"
    t.string "school_last_year"
    t.string "school_last_name"
    t.string "school_last_status"
    t.string "school_last_age"
    t.string "school_last_address"
    t.boolean "is_working"
    t.string "work_activity"
    t.string "work_activity_other"
    t.string "work_is_paid"
    t.string "work_weekly_hours"
    t.boolean "parents_has_mother"
    t.boolean "parents_has_father"
    t.boolean "parents_has_brother"
    t.string "parents_who_is_guardian"
    t.string "parents_income"
    t.string "mother_name"
    t.string "guardian_name"
    t.string "guardian_rg"
    t.string "guardian_cpf"
    t.string "guardian_dob"
    t.string "guardian_phone"
    t.string "guardian_race"
    t.string "guardian_schooling"
    t.string "guardian_job"
    t.json "case_cause_ids"
    t.string "handicapped_reason_not_enrolled"
    t.boolean "handicapped_at_sus"
    t.string "place_address"
    t.string "place_cep"
    t.string "place_reference"
    t.string "place_neighborhood"
    t.string "place_city_name"
    t.string "place_uf"
    t.string "place_kind"
    t.boolean "place_is_quilombola"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "place_city_id", limit: 36
    t.string "school_last_id", limit: 36
    t.datetime "started_at"
    t.decimal "place_lat", precision: 18, scale: 12
    t.decimal "place_lng", precision: 18, scale: 12
    t.string "place_map_region"
    t.json "place_map_geocoded_address"
    t.boolean "parents_has_others"
    t.boolean "parents_has_grandparents"
    t.json "aux"
    t.index ["assigned_group_id"], name: "case_steps_pesquisa_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_pesquisa_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_pesquisa_case_id_index"
    t.index ["child_id"], name: "case_steps_pesquisa_child_id_index"
    t.index ["completed_at"], name: "case_steps_pesquisa_completed_at_index"
    t.index ["gender"], name: "case_steps_pesquisa_gender_index"
    t.index ["guardian_race"], name: "case_steps_pesquisa_guardian_race_index"
    t.index ["guardian_schooling"], name: "case_steps_pesquisa_guardian_schooling_index"
    t.index ["handicapped_at_sus"], name: "case_steps_pesquisa_handicapped_at_sus_index"
    t.index ["has_been_in_school"], name: "case_steps_pesquisa_has_been_in_school_index"
    t.index ["is_completed"], name: "case_steps_pesquisa_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_pesquisa_is_pending_assignment_index"
    t.index ["is_working"], name: "case_steps_pesquisa_is_working_index"
    t.index ["next_index"], name: "case_steps_pesquisa_next_index_index"
    t.index ["next_type"], name: "case_steps_pesquisa_next_type_index"
    t.index ["parents_has_brother"], name: "case_steps_pesquisa_parents_has_brother_index"
    t.index ["parents_has_father"], name: "case_steps_pesquisa_parents_has_father_index"
    t.index ["parents_has_mother"], name: "case_steps_pesquisa_parents_has_mother_index"
    t.index ["parents_who_is_guardian"], name: "case_steps_pesquisa_parents_who_is_guardian_index"
    t.index ["place_city_id"], name: "case_steps_pesquisa_place_city_id_index"
    t.index ["place_city_name"], name: "case_steps_pesquisa_place_city_index"
    t.index ["place_is_quilombola"], name: "case_steps_pesquisa_place_is_quilombola_index"
    t.index ["place_kind"], name: "case_steps_pesquisa_place_kind_index"
    t.index ["place_uf"], name: "case_steps_pesquisa_place_uf_index"
    t.index ["race"], name: "case_steps_pesquisa_race_index"
    t.index ["school_last_id"], name: "case_steps_pesquisa_school_last_id_index"
    t.index ["step_index"], name: "case_steps_pesquisa_step_index_index"
    t.index ["step_type"], name: "case_steps_pesquisa_step_type_index"
    t.index ["tenant_id"], name: "case_steps_pesquisa_tenant_id_index"
  end

  create_table "case_steps_rematricula", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.boolean "is_completed", default: false, null: false
    t.string "child_id", limit: 36, null: false
    t.string "case_id", limit: 36, null: false
    t.string "step_type", null: false
    t.integer "step_index", default: 1, null: false
    t.integer "next_index"
    t.string "next_type"
    t.string "assigned_user_id", limit: 36
    t.string "assigned_group_id", limit: 36
    t.boolean "is_pending_assignment", default: false, null: false
    t.datetime "completed_at"
    t.date "reinsertion_date"
    t.string "reinsertion_grade"
    t.string "school_name"
    t.string "school_censo_id"
    t.string "school_address"
    t.string "school_cep"
    t.string "school_neighborhood"
    t.string "school_city_name"
    t.string "school_uf"
    t.string "school_contact_name"
    t.string "school_contact_email"
    t.string "school_contact_position"
    t.string "school_phone"
    t.string "school_email"
    t.text "observations", limit: 16777215
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "school_city_id", limit: 36
    t.string "school_id", limit: 36
    t.datetime "started_at"
    t.index ["assigned_group_id"], name: "case_steps_rematricula_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "case_steps_rematricula_assigned_user_id_index"
    t.index ["case_id"], name: "case_steps_rematricula_case_id_index"
    t.index ["child_id"], name: "case_steps_rematricula_child_id_index"
    t.index ["completed_at"], name: "case_steps_rematricula_completed_at_index"
    t.index ["is_completed"], name: "case_steps_rematricula_is_completed_index"
    t.index ["is_pending_assignment"], name: "case_steps_rematricula_is_pending_assignment_index"
    t.index ["next_index"], name: "case_steps_rematricula_next_index_index"
    t.index ["next_type"], name: "case_steps_rematricula_next_type_index"
    t.index ["school_city_id"], name: "case_steps_rematricula_school_city_id_index"
    t.index ["school_id"], name: "case_steps_rematricula_school_id_index"
    t.index ["step_index"], name: "case_steps_rematricula_step_index_index"
    t.index ["step_type"], name: "case_steps_rematricula_step_type_index"
    t.index ["tenant_id"], name: "case_steps_rematricula_tenant_id_index"
  end

  create_table "children", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36, null: false
    t.string "city_id", limit: 36, null: false
    t.string "child_status", default: "out_of_school", null: false
    t.string "name"
    t.string "mother_name"
    t.string "father_name"
    t.integer "age"
    t.string "gender"
    t.string "risk_level", default: "low", null: false
    t.string "current_case_id", limit: 36
    t.string "current_step_type"
    t.string "current_step_id", limit: 36
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "alert_status", default: "pending", null: false
    t.string "deadline_status", default: "normal", null: false
    t.string "alert_submitter_id", limit: 36
    t.decimal "lat", precision: 18, scale: 12
    t.decimal "lng", precision: 18, scale: 12
    t.string "map_region"
    t.json "map_geocoded_address"
    t.string "educacenso_id"
    t.integer "educacenso_year"
    t.index ["alert_status"], name: "children_alert_status_index"
    t.index ["alert_submitter_id"], name: "children_alert_submitter_id_index"
    t.index ["child_status"], name: "children_child_status_index"
    t.index ["city_id"], name: "children_city_id_index"
    t.index ["current_case_id"], name: "children_current_case_id_index"
    t.index ["current_step_id"], name: "children_current_step_id_index"
    t.index ["current_step_type"], name: "children_current_step_type_index"
    t.index ["deadline_status"], name: "children_deadline_status_index"
    t.index ["educacenso_id"], name: "children_educacenso_id_index"
    t.index ["gender"], name: "children_gender_index"
    t.index ["map_region"], name: "children_map_region_index"
    t.index ["risk_level"], name: "children_risk_level_index"
    t.index ["tenant_id"], name: "children_tenant_id_index"
  end

  create_table "children_cases", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.string "child_id", limit: 36, null: false
    t.string "case_status", default: "in_progress", null: false
    t.string "name"
    t.string "risk_level", default: "medium", null: false
    t.boolean "is_current", default: true, null: false
    t.string "assigned_group_id", limit: 36
    t.string "assigned_user_id", limit: 36
    t.string "created_by_user_id", limit: 36
    t.json "case_cause_ids"
    t.string "alert_cause_id"
    t.string "current_step_id", limit: 36
    t.string "current_step_type"
    t.json "linked_steps"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.date "enrolled_at"
    t.timestamp "deleted_at"
    t.string "cancel_reason"
    t.index ["alert_cause_id"], name: "children_cases_alert_cause_id_index"
    t.index ["assigned_group_id"], name: "children_cases_assigned_group_id_index"
    t.index ["assigned_user_id"], name: "children_cases_assigned_user_id_index"
    t.index ["case_status"], name: "children_cases_case_status_index"
    t.index ["child_id"], name: "children_cases_child_id_index"
    t.index ["created_by_user_id"], name: "children_cases_created_by_user_id_index"
    t.index ["enrolled_at"], name: "children_cases_enrolled_at_index"
    t.index ["is_current"], name: "children_cases_is_current_index"
    t.index ["tenant_id"], name: "children_cases_tenant_id_index"
  end

  create_table "cities", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "region", limit: 2, null: false
    t.string "uf", limit: 2, null: false
    t.string "slug"
    t.string "name"
    t.string "name_ascii"
    t.string "ibge_city_id"
    t.string "ibge_uf_id"
    t.string "ibge_region_id"
    t.string "webdoc_url"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["ibge_city_id"], name: "cities_ibge_city_id_index"
    t.index ["name"], name: "full", type: :fulltext
    t.index ["region"], name: "cities_region_index"
    t.index ["slug"], name: "cities_slug_index"
    t.index ["uf"], name: "cities_uf_index"
  end

  create_table "comments", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.string "content_type", null: false
    t.string "content_id", limit: 36, null: false
    t.string "author_id", limit: 36
    t.text "message", limit: 16777215
    t.json "metadata"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["author_id"], name: "comments_author_id_index"
    t.index ["content_id"], name: "comments_content_id_index"
    t.index ["content_type"], name: "comments_content_type_index"
    t.index ["tenant_id"], name: "comments_tenant_id_index"
  end

  create_table "failed_jobs", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text "connection", null: false
    t.text "queue", null: false
    t.text "payload", limit: 4294967295, null: false
    t.text "exception", limit: 4294967295, null: false
    t.timestamp "failed_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "group_causes", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36, null: false
    t.string "group_id", limit: 36, null: false
    t.string "alert_cause_id", limit: 36, null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["alert_cause_id"], name: "group_causes_alert_cause_id_index"
    t.index ["group_id"], name: "group_causes_group_id_index"
    t.index ["tenant_id"], name: "group_causes_tenant_id_index"
  end

  create_table "groups", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "tenant_id", limit: 36
    t.string "uf"
    t.string "name"
    t.boolean "is_primary", default: false, null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.text "settings", limit: 4294967295
    t.index ["is_primary"], name: "groups_is_primary_index"
    t.index ["tenant_id"], name: "groups_tenant_id_index"
    t.index ["uf"], name: "groups_uf_index"
  end

  create_table "import_jobs", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "type", null: false
    t.string "status", default: "pending", null: false
    t.string "user_id", limit: 36
    t.string "path"
    t.json "metadata"
    t.integer "offset", default: 0, null: false
    t.integer "total_records", default: 0, null: false
    t.json "errors"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "tenant_id", limit: 36
    t.index ["tenant_id"], name: "import_jobs_tenant_id_index"
    t.index ["type"], name: "import_jobs_type_index"
    t.index ["user_id"], name: "import_jobs_user_id_index"
  end

  create_table "jobs", id: :bigint, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "queue", null: false
    t.text "payload", limit: 4294967295, null: false
    t.integer "attempts", limit: 1, null: false, unsigned: true
    t.integer "reserved_at", unsigned: true
    t.integer "available_at", null: false, unsigned: true
    t.integer "created_at", null: false, unsigned: true
    t.index ["queue", "reserved_at"], name: "jobs_queue_reserved_at_index"
  end

  create_table "migrations", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "notifications", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "type", null: false
    t.string "notifiable_id", limit: 36, null: false
    t.string "notifiable_type", null: false
    t.text "data", null: false
    t.timestamp "read_at"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["notifiable_id"], name: "notifications_notifiable_id_index"
    t.index ["notifiable_type"], name: "notifications_notifiable_type_index"
  end

  create_table "password_resets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.timestamp "created_at"
    t.index ["email"], name: "password_resets_email_index"
    t.index ["token"], name: "password_resets_token_index"
  end

  create_table "schools", id: :string, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "uf_id"
    t.string "uf"
    t.string "region"
    t.string "city_id", limit: 36
    t.string "city_name"
    t.string "city_ibge_id"
    t.json "metadata"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["city_ibge_id"], name: "schools_city_ibge_id_index"
    t.index ["city_id"], name: "schools_city_id_index"
    t.index ["region"], name: "schools_region_index"
    t.index ["uf"], name: "schools_uf_index"
  end

  create_table "sms_conversations", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "user_id", limit: 36
    t.string "tenant_id", limit: 36
    t.string "spawned_child_id", limit: 36
    t.string "phone_number"
    t.string "conversation_step"
    t.json "received_messages"
    t.json "metadata"
    t.json "alert_fields"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["phone_number"], name: "sms_conversations_phone_number_index"
    t.index ["tenant_id"], name: "sms_conversations_tenant_id_index"
    t.index ["user_id"], name: "sms_conversations_user_id_index"
  end

  create_table "state_signups", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "uf", null: false
    t.string "admin_id", limit: 36
    t.string "coordinator_id", limit: 36
    t.string "judged_by", limit: 36
    t.boolean "is_approved", default: false, null: false
    t.string "ip_addr", limit: 45
    t.string "user_agent", limit: 512
    t.json "data"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["admin_id"], name: "state_signups_user_id_index"
    t.index ["coordinator_id"], name: "state_signups_coordinator_id_index"
    t.index ["judged_by"], name: "state_signups_judged_by_index"
    t.index ["uf"], name: "state_signups_uf_index"
  end

  create_table "support_tickets", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "user_id", limit: 36
    t.string "tenant_id", limit: 36
    t.string "name"
    t.string "city_name"
    t.string "email"
    t.string "phone"
    t.string "user_agent"
    t.text "message", limit: 16777215
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.index ["tenant_id"], name: "support_tickets_tenant_id_index"
    t.index ["user_id"], name: "support_tickets_user_id_index"
  end

  create_table "tenant_signups", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "city_id", limit: 36, null: false
    t.string "tenant_id", limit: 36
    t.boolean "is_approved", default: false, null: false
    t.boolean "is_provisioned", default: false, null: false
    t.string "ip_addr", limit: 45
    t.string "user_agent", limit: 512
    t.json "data"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "judged_by", limit: 36
    t.index ["city_id"], name: "signups_city_id_index"
    t.index ["judged_by"], name: "signups_judged_by_index"
  end

  create_table "tenants", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "city_id", limit: 36, null: false
    t.string "uf", limit: 2
    t.string "signup_id", limit: 36
    t.string "primary_group_id", limit: 36
    t.string "operational_admin_id", limit: 36
    t.string "political_admin_id", limit: 36
    t.boolean "is_registered", default: false, null: false
    t.boolean "is_active", default: false, null: false
    t.boolean "is_setup", default: false, null: false
    t.datetime "last_active_at", null: false
    t.datetime "registered_at", null: false
    t.datetime "activated_at", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.timestamp "deleted_at"
    t.string "name"
    t.string "name_ascii"
    t.text "settings", limit: 4294967295
    t.decimal "map_lat", precision: 18, scale: 12
    t.decimal "map_lng", precision: 18, scale: 12
    t.text "educacenso_import_details", limit: 4294967295
    t.index ["is_active"], name: "tenants_is_active_index"
    t.index ["is_registered"], name: "tenants_is_registered_index"
    t.index ["name_ascii"], name: "tenants_name_ascii_index"
    t.index ["uf"], name: "tenants_uf_index"
  end

  create_table "users", id: :string, limit: 36, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "type", null: false
    t.string "tenant_id", limit: 36
    t.string "city_id", limit: 36
    t.string "uf", limit: 2
    t.string "group_id", limit: 36
    t.timestamp "deleted_at"
    t.date "dob"
    t.string "cpf"
    t.string "work_phone"
    t.string "work_mobile"
    t.string "personal_mobile"
    t.string "skype_username"
    t.string "work_address"
    t.string "work_cep"
    t.string "work_neighborhood"
    t.string "work_uf"
    t.string "institution"
    t.string "position"
    t.string "work_city_id", limit: 36
    t.string "work_city_name"
    t.text "settings", limit: 4294967295
    t.index ["city_id"], name: "users_city_id_index"
    t.index ["email"], name: "users_email_index"
    t.index ["group_id"], name: "users_group_id_index"
    t.index ["tenant_id"], name: "users_tenant_id_index"
    t.index ["type"], name: "users_type_index"
    t.index ["uf"], name: "users_uf_index"
    t.index ["work_city_id"], name: "users_work_city_id_index"
  end

end
