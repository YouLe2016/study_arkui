export class TaskConst {
  private constructor() {
  }

  static readonly StatusDone = 1
  static readonly StatusUndone = TaskConst.StatusDone + 1
  static readonly StatusDoing = TaskConst.StatusUndone + 1
  static readonly StatusFuture = TaskConst.StatusDoing + 1
}