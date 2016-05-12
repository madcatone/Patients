# Patients

## 1. 病人/Patients

字段名  | 英文名 | 字段类型 |主键 |备注
--------- | --------| ----------| --------| -----
名字                |first_name| string :|
中間名                |middle_name *| string :|
姓氏                | last_name *| string :| | 
出生日期        | birth_at *| date :|
醫療紀錄編號                 |medical_record_no| string|
性別           |gender| string|
狀態            |status| string |
地點        | location_id | integer | true | 关联地點
瀏覽人數      |view_count | integer |
是否刪除            |deletion| boolean|


#### 性別/gender：
类型 | 说明　| 补充
---- |---- |---
not_available | 不可用 |
male | 男 |
female | 女 |

#### 狀態/status:
类型 | 说明　| 补充
---- |---- |---
Initial | 初診 |
Referred | 转院 |
Treatment | 疗程 |
Closed |結束 |

#### 刪除/deletion:
类型 | 说明　| 补充
---- |---- |---
false | 未刪除, 所有病人均為該類別 |可見
true | 已刪除, 所有病人刪除後均為該類別 |不可見

## 2. 地點/Location

字段名  | 英文名 | 字段类型 |主键 |备注
--------- | --------| ----------| --------| -----
编码                |code| string :||
姓名                |name *| string :||
