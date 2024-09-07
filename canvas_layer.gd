extends CanvasLayer

@onready var score = $score_card/Score
@onready var Kleo = $score_card/Kleopatra
@onready var victory_label = $score_card/victory_label
@onready var animation_player = $AnimationPlayer
@onready var amount_labe = $score_card/amount_needed

var victory_reweld

func _ready() -> void:
	amount_labe.visible = false
	score.text = "0 :Soldiers"
	Kleo.text = "0 :Cleopatras"
	update_score()
	if Global.soldiers > 4000:
		victory_label.text = "VICTORY!"
		victory_reweld = true
	else:
		victory_label.text = "YOU LOSE"
		victory_reweld = false
	
func update_score() -> void:
	var shown_score = 0
	var shown_kleo = 0
	while shown_score < Global.soldiers:
		shown_score += min(100,Global.soldiers - shown_score)
		score.text = str(shown_score) + " Soldiers"
		await get_tree().create_timer(0.02).timeout
	while shown_kleo < Global.cleopatras:
		shown_kleo += min(1,Global.cleopatras - shown_kleo)
		Kleo.text = str(shown_kleo) + "/5 Cleopatras"
		await get_tree().create_timer(0.1).timeout
	await  get_tree().create_timer(0.5).timeout
	animation_player.play("Points_tally")
	
	if victory_reweld:
		pass
	else:
		pass
