json.array!(@players) do |player|
  json.extract! player, :id, :campaign_id, :user_id, :status, :status_approved_by, :who_can_change_status
  json.url player_url(player, format: :json)
end
