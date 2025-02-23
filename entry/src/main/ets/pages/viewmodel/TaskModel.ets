import { TaskConst } from "../../common/TaskConst"

export class TaskModel {
  id: string = ""
  title: string = ""
  description: string = ""
  date: Date = new Date()
  startTime: string = ""
  endTime: string = ""
  type: number = 1
  tags: number = 1
  status: number = TaskConst.StatusUndone

  
}

