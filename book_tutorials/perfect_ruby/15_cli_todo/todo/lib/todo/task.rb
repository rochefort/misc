# -*- coding: utf-8 -*-

require 'active_record'

module Todo
  # tasksテーブルを表現するモデルクラスです
  # @author sugamasao
  class Task < ActiveRecord::Base
    NOT_YET = 0 # タスクが完了していない
    DONE    = 1 # タスクが完了した
    PENDING = 2 # 保留状態のタスク

    # ステータスの名称と数値の組み合わせの値
    STATUS = {
      'NOT_YET' => NOT_YET,
      'DONE'    => DONE,
      'PENDING' => PENDING
    }.freeze
  end
end