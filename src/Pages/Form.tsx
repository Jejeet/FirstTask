import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import * as z from "zod";

// 1. Define Validation Schema
const schema = z.object({
  firstName: z.string().min(2, "Too short"),
  email: z.string().email("Invalid email"),
  // ... 8 more fields
});

export function CheckoutForm() {
  // 2. Initialize the library
  const { register, handleSubmit, formState: { errors, isValid } } = useForm({
    resolver: zodResolver(schema),
    mode: "onChange" // For real-time validation
  });

  // 3. Progress Bar Logic
  const progress = calculateProgress(isValid); 

  return (
    <form onSubmit={handleSubmit(data => console.log(data))}>
      <input {...register("firstName")} />
      {errors.firstName && <span>{errors.firstName.message}</span>}
      
      {/* Navigation and Progress UI here */}
    </form>
  );
}
