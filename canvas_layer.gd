extends CanvasLayer

@onready var score = $score_card/Score
@onready var Kleo = $score_card/Kleopatra
@onready var label = $score_card/Label
@onready var you_need = $score_card/you_need
@onready var amount_needed = $score_card/amount_needed
@onready var victory_l = $score_card/victory_label

signal victory_reweld

func _ready() -> void:
	Global.cleopatras = 2
	score.text = "0 :Soldiers"
	Kleo.text = "0 :Cleopatras"
	you_need.visible = false
	amount_needed.visible = false
	victory_l.visible = false
	update_score()
	
func update_score() -> void:
	var shown_score = 0
	var shown_kleo = 0
	while shown_score < Global.soldiers:
		shown_score += min(100,Global.soldiers - shown_score)
		score.text = str(shown_score) + " :Soldiers"
		await get_tree().create_timer(0.1).timeout
	while shown_kleo < Global.soldiers:
		shown_kleo += min(100,Global.cleopatras - shown_kleo)
		Kleo.text = str(shown_kleo) + " :Cleopatras"
		await get_tree().create_timer(0.1).timeout
	await get_tree().create_timer(0.5).timeout
	you_need.visible = true
	await get_tree().create_timer(1).timeout
	amount_needed.visible = true
	victory_l.visible = true
	if Global.soldiers >= 4000:
		victory_reweld.emit(true)
	else:
		victory_reweld.emit(false)
