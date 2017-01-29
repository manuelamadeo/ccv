.class Lcom/club_ciclista/valverdedejucar/MainActivity$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/webkit/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/club_ciclista/valverdedejucar/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/club_ciclista/valverdedejucar/MainActivity;


# direct methods
.method constructor <init>(Lcom/club_ciclista/valverdedejucar/MainActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$6;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadStart(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/club_ciclista/valverdedejucar/MainActivity$6;->a:Lcom/club_ciclista/valverdedejucar/MainActivity;

    invoke-virtual {v1, v0}, Lcom/club_ciclista/valverdedejucar/MainActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
