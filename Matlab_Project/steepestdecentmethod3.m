function xk=steepestdecentmethod3(f,xs,e,gama)
  syms x1 x2 
  g=symvar(f);
  f=subs(f,g,g);
  grad=gradient(f);
  gradf=grad(x1,x2); %βάζουμε το gradient σε πίνακα για να κάνουμε πράξεις
  xk(1,:)=xs;  %ξεκινάμε με xs=(x1,x2)
  k=1;
  gradfxk=subs(gradf,g,xk(1,:));
  maxk=100;  %Για πάνω από maxk επαναλήψεις, βγες από την μέθοδο
  while e<=norm(gradfxk) && k<=maxk %Αν ε<=|gradient(f(xk))| συνεχίζει το loop ή αν φτάσει στις μέγιστες επαναλήψεις
      dk=-gradfxk; %δκ=-gradient(f(xk))
      d=double(dk);
      gk=gama;
      xk(k+1,:)=xk(k,:)+gk.*transpose(d); %x(κ+1)=x(κ)+γκ*δκ
      k=k+1;
      gradfxk=subs(gradf,g,xk(k,:));
      if k==maxk
          fprintf('Πολλές επαναλήψεις-> Η μέθοδος δεν συγκλίνει(ή συγκλίνει πολύ αργά) για γ=%f\n', gama)  
      end
  end
end