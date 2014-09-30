<?php

class Post extends AppModel {
    public $validate = array(
        'title' => array(
            'rule' => 'notEmpty',
            'message' => '空じゃダメだし'
        ),
        'body' => array(
            'rule' => 'notEmpty'
        )
    );
}
