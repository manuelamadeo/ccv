.class Lorg/apache/cordova/dialogs/Notification$4;
.super Ljava/lang/Object;
.source "Notification.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/dialogs/Notification;->prompt(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/dialogs/Notification;

.field final synthetic val$buttonLabels:Lorg/json/JSONArray;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$cordova:Lorg/apache/cordova/CordovaInterface;

.field final synthetic val$defaultText:Ljava/lang/String;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/dialogs/Notification;Lorg/apache/cordova/CordovaInterface;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/dialogs/Notification;

    .prologue
    .line 287
    iput-object p1, p0, Lorg/apache/cordova/dialogs/Notification$4;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iput-object p2, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    iput-object p3, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$defaultText:Ljava/lang/String;

    iput-object p4, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$message:Ljava/lang/String;

    iput-object p5, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$title:Ljava/lang/String;

    iput-object p6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    iput-object p7, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x2

    const/4 v8, 0x1

    .line 289
    new-instance v2, Landroid/widget/EditText;

    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 294
    .local v2, "promptInput":Landroid/widget/EditText;
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v6}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    .line 295
    .local v4, "resources":Landroid/content/res/Resources;
    const v6, 0x1060003

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 296
    .local v3, "promptInputTextColor":I
    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setTextColor(I)V

    .line 297
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$defaultText:Ljava/lang/String;

    invoke-virtual {v2, v6}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 298
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->this$0:Lorg/apache/cordova/dialogs/Notification;

    iget-object v7, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$cordova:Lorg/apache/cordova/CordovaInterface;

    # invokes: Lorg/apache/cordova/dialogs/Notification;->createDialog(Lorg/apache/cordova/CordovaInterface;)Landroid/app/AlertDialog$Builder;
    invoke-static {v6, v7}, Lorg/apache/cordova/dialogs/Notification;->access$000(Lorg/apache/cordova/dialogs/Notification;Lorg/apache/cordova/CordovaInterface;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 299
    .local v0, "dlg":Landroid/app/AlertDialog$Builder;
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$message:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 300
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$title:Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 301
    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 303
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 305
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 308
    .local v5, "result":Lorg/json/JSONObject;
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 310
    :try_start_0
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/apache/cordova/dialogs/Notification$4$1;

    invoke-direct {v7, p0, v5, v2}, Lorg/apache/cordova/dialogs/Notification$4$1;-><init>(Lorg/apache/cordova/dialogs/Notification$4;Lorg/json/JSONObject;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    :cond_0
    :goto_0
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-le v6, v8, :cond_1

    .line 331
    :try_start_1
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/apache/cordova/dialogs/Notification$4$2;

    invoke-direct {v7, p0, v5, v2}, Lorg/apache/cordova/dialogs/Notification$4$2;-><init>(Lorg/apache/cordova/dialogs/Notification$4;Lorg/json/JSONObject;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setNeutralButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 350
    :cond_1
    :goto_1
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-le v6, v9, :cond_2

    .line 352
    :try_start_2
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->val$buttonLabels:Lorg/json/JSONArray;

    const/4 v7, 0x2

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lorg/apache/cordova/dialogs/Notification$4$3;

    invoke-direct {v7, p0, v5, v2}, Lorg/apache/cordova/dialogs/Notification$4$3;-><init>(Lorg/apache/cordova/dialogs/Notification$4;Lorg/json/JSONObject;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6, v7}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    .line 369
    :cond_2
    :goto_2
    new-instance v6, Lorg/apache/cordova/dialogs/Notification$4$4;

    invoke-direct {v6, p0, v5, v2}, Lorg/apache/cordova/dialogs/Notification$4$4;-><init>(Lorg/apache/cordova/dialogs/Notification$4;Lorg/json/JSONObject;Landroid/widget/EditText;)V

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 380
    iget-object v6, p0, Lorg/apache/cordova/dialogs/Notification$4;->this$0:Lorg/apache/cordova/dialogs/Notification;

    # invokes: Lorg/apache/cordova/dialogs/Notification;->changeTextDirection(Landroid/app/AlertDialog$Builder;)V
    invoke-static {v6, v0}, Lorg/apache/cordova/dialogs/Notification;->access$100(Lorg/apache/cordova/dialogs/Notification;Landroid/app/AlertDialog$Builder;)V

    .line 381
    return-void

    .line 323
    :catch_0
    move-exception v1

    .line 324
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "Notification"

    const-string v7, "JSONException on first button."

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 344
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 345
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v6, "Notification"

    const-string v7, "JSONException on second button."

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 365
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_2
    move-exception v1

    .line 366
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v6, "Notification"

    const-string v7, "JSONException on third button."

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method
