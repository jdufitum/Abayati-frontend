//virtual try on
class VirtualTryonRsp {
  final String taskId;
  final String taskStatus;
  final String taskStatusMsg;
  final TaskResult taskResult;
  final int createdAt;
  final int updatedAt;

  VirtualTryonRsp({
    required this.taskId,
    required this.taskStatus,
    required this.taskStatusMsg,
    required this.taskResult,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VirtualTryonRsp.fromJson(Map<String, dynamic> json) =>
      VirtualTryonRsp(
        taskId: json["task_id"],
        taskStatus: json["task_status"],
        taskStatusMsg: json["task_status_msg"],
        taskResult: TaskResult.fromJson(json["task_result"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );
}

class TaskResult {
  final List<Image> images;

  TaskResult({
    required this.images,
  });

  factory TaskResult.fromJson(Map<String, dynamic> json) => TaskResult(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );
}

class Image {
  final int index;
  final String url;

  Image({
    required this.index,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        index: json["index"],
        url: json["url"],
      );
}
