.class public Lcom/club_ciclista/valverdedejucar/MainActivity$a;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/club_ciclista/valverdedejucar/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field a:Landroid/content/Context;

.field final synthetic b:Lcom/club_ciclista/valverdedejucar/MainActivity;


# direct methods
.method constructor <init>(Lcom/club_ciclista/valverdedejucar/MainActivity;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public exitApp()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->b()Ljava/lang/Void;

    return-void
.end method

.method public openExternal(Ljava/lang/String;)V
    .locals 3
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v1, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public shareIntent()V
    .locals 4
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.SUBJECT"

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f070009

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.extra.TEXT"

    iget-object v2, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f07000a

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->a:Landroid/content/Context;

    const-string v2, "Share App via"

    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public showAboutDialog()V
    .locals 1
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->b:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->c()V

    return-void
.end method

.method public showToast(Ljava/lang/String;)V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$a;->a:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
